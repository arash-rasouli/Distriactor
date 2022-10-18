 grammar distractor;

 program : (actor)+ main;

 actor:
        ACTOR IDENTIFIER {System.out.println("ActorDec:" + $IDENTIFIER.getText());}
        LBRACE
        (annotation? msgHandler | annotation? observer | func )*
        ( (stateVars? (annotation? msgHandler | annotation? observer | func )* constructor) |
        (constructor (annotation? msgHandler | annotation? observer | func )* stateVars?) )
        (annotation? msgHandler | annotation? observer | func )*
        RBRACE;

 annotation:
        ATSIGN {System.out.println("ANNOTATION");} IGNORED LPAREN expression RPAREN SEMICOLON;

 msgHandler:
        MSGHANDLER {System.out.print("MsgHandlerDec:");}
        IDENTIFIER {System.out.print($IDENTIFIER.getText());}
        LPAREN argDec RPAREN
        {System.out.println("");} LBRACE (handlerContent)* RBRACE;

 observer:
        OBSERVER {System.out.print("ObserverDec: ");}
        IDENTIFIER {System.out.print($IDENTIFIER.getText());}
        LPAREN argDec RPAREN
        {System.out.println("");} LBRACE (handlerContent)* RBRACE;

 func:
        FUNC {System.out.print("FunctionDec:");}
        (primitiveType |IDENTIFIER | LIST LT (primitiveType | IDENTIFIER) GT | VOID)
        IDENTIFIER {System.out.println($IDENTIFIER.getText());}
        LPAREN argDec RPAREN
        LBRACE (functionContent)* RBRACE;

 constructor:
        IDENTIFIER {System.out.println("Constructor:" + $IDENTIFIER.getText());}
        LPAREN argDec RPAREN
        LBRACE (handlerContent)* RBRACE;


 stateVars:
        STATEVARS LBRACE (varDec)* RBRACE;

 handlerContent:
         varDec | statement ;

 functionContent:
        varDec | statement ;

 returnStatement: RETURN {System.out.println("return");} (expression)? SEMICOLON;

 mainStmt:
        mainConsole_outSmt|
        mainAssignStmt|
        mainUntilStmt|
        mainIfStmt|
        breakStmt|
        mainListAdd|
        mainListRemove;

 statement:
        console_outSmt|
        assignStmt|
        untilStmt|
        ifStmt|
        breakStmt|
        listAdd|
        listRemove|
        msgHandlerAsincCall|
        msgHandlerSincCall|
        announceStmt|
        returnStatement|
        functionCall;

 console_outSmt:
        CONSOLE_OUT {System.out.println("Built-in:console_out");} LPAREN ((expression)) RPAREN SEMICOLON;

 mainConsole_outSmt:
         CONSOLE_OUT {System.out.println("Built-in:console_out");} LPAREN ((mainExpression)) RPAREN SEMICOLO;

 assignStmt:
        lExpression op=ASSIGN {System.out.println("Operator:" + $op.getText());} expression  SEMICOLON;

 mainAssignStmt:
        mainLExpression op=ASSIGN  {System.out.println("Operator:" + $op.getText());}  mainExpression SEMICOLON;

 lExpression:
        (SELF DOT)? (IDENTIFIER  | listCall) ;

 mainLExpression:
         IDENTIFIER  | mainListCall;

 untilStmt:
     	UNTIL LPAREN expression RPAREN statement;

 mainUntilStmt:
      	UNTIL LPAREN mainExpression RPAREN mainStmt;

 ifStmt:
      	op=IF {System.out.println($op.getText());} LPAREN expression RPAREN LBRACE statement* RBRACE (op=ELSE {System.out.println($op.getText());} statement)?;

 mainIfStmt:
       	op=IF {System.out.println($op.getText());} LPAREN mainExpression RPAREN LBRACE mainStmt* RBRACE (op=ELSE {System.out.println($op.getText());} mainStmt)?;

 breakStmt:
      	op=BREAK {System.out.println($op.getText());} SEMICOLON;

 expression:
     	orExpression;


 mainExpression:
      	mainOrExpression;

 orExpression:
 	    andExpression (op=OR andExpression {System.out.println("Operator:" + $op.getText());})*;

 mainOrExpression:
  	    mainAndExpression (op=OR mainAndExpression {System.out.println("Operator:" + $op.getText());})*;

 andExpression:
 	    equalityExpression (op=AND equalityExpression {System.out.println("Operator:" + $op.getText());})*;

 mainAndExpression:
  	    mainEqualityExpression (op=AND mainEqualityExpression {System.out.println("Operator:" + $op.getText());})*;

 equalityExpression:
     	relationalExpression ( op=(EQ | NEQ) relationalExpression {System.out.println("Operator:" + $op.getText());})*;

 mainEqualityExpression:
      	mainRelationalExpression ( op=(EQ | NEQ) mainRelationalExpression {System.out.println("Operator:" + $op.getText());})*;


 relationalExpression:
        additiveExpression (op=(LT | GT) additiveExpression {System.out.println("Operator:" + $op.getText());})*;

 mainRelationalExpression:
         mainAdditiveExpression (op=(LT | GT) mainAdditiveExpression {System.out.println("Operator:" + $op.getText());})*;

 additiveExpression:
        multiplicativeExpression (op=(PLUS | MINUS) multiplicativeExpression {System.out.println("Operator:" + $op.getText());})*;

 mainAdditiveExpression:
         mainMultiplicativeExpression (op=(PLUS | MINUS) mainMultiplicativeExpression{System.out.println("Operator:" + $op.getText());})*;

 multiplicativeExpression:
        preUnaryExpression (op=(MULT | DIV ) preUnaryExpression{System.out.println("Operator:" + $op.getText());})*;

 mainMultiplicativeExpression:
         mainPreUnaryExpression (op=(MULT | DIV ) mainPreUnaryExpression{System.out.println("Operator:" + $op.getText());})*;

 preUnaryExpression:
        op=NOT preUnaryExpression {System.out.println("Operator:" + $op.getText());}|
        op=MINUS preUnaryExpression {System.out.println("Operator:" + $op.getText());}|
        otherExpression;

 mainPreUnaryExpression:
         op=NOT mainPreUnaryExpression {System.out.println("Operator:" + $op.getText());}|
         op=MINUS mainPreUnaryExpression {System.out.println("Operator:" + $op.getText());}|
         mainOtherExpression;

 otherExpression:
        listCall |
        listMethods |
        value |
        SENDER;

 mainOtherExpression:
         mainListCall |
         mainListMethods |
         mainValue ;


 listCall:
         (SELF DOT)? IDENTIFIER LBRACKET expression RBRACKET;

 mainListCall:
          (SELF DOT)? IDENTIFIER LBRACKET mainExpression RBRACKET;


 listMethods:
        (SELF DOT)? IDENTIFIER DOT
        (op=HAS {System.out.println($op.getText());} LPAREN expression RPAREN|
         op=SIZE {System.out.println($op.getText());} LPAREN RPAREN);

 listAdd:
     IDENTIFIER DOT op=ADD {System.out.println($op.getText());} LPAREN expression RPAREN SEMICOLON ;

 listRemove:
     IDENTIFIER DOT op=REMOVE {System.out.println($op.getText());} LPAREN expression RPAREN SEMICOLON;


 mainListMethods:
         (SELF DOT)? IDENTIFIER DOT
         (op=HAS {System.out.println($op.getText());} LPAREN mainExpression RPAREN|
          op=SIZE {System.out.println($op.getText());} LPAREN RPAREN);

 mainListAdd:
         IDENTIFIER op=DOT ADD {System.out.println($op.getText());} LPAREN mainExpression RPAREN SEMICOLON;

 mainListRemove:
        IDENTIFIER op=DOT REMOVE {System.out.println($op.getText());} LPAREN mainExpression RPAREN SEMICOLON;


 value:
    ((SELF DOT )? (INTVALUE | BOOLVALUE | STRINGVALUE  | listValue | IDENTIFIER)) | functionCall;

 mainValue:
      INTVALUE | BOOLVALUE | STRINGVALUE  | mainListValue | IDENTIFIER ;

 listValue:
    LBRACKET (IDENTIFIER|value) (COMMA (IDENTIFIER|value))* RBRACKET;

 mainListValue:
     LBRACKET (IDENTIFIER|mainValue) (COMMA (IDENTIFIER|mainValue))* RBRACKET;

 functionCall:
        {System.out.print("FunctionCall:");}
        SELF DOT IDENTIFIER {System.out.println($IDENTIFIER.getText());}
        LPAREN expressionList RPAREN;

 msgHandlerAsincCall:
        (SENDER | IDENTIFIER | listCall |functionCall)
        ARROW IDENTIFIER {System.out.println("MsgHandlerAsincCall:" + $IDENTIFIER.getText());} LPAREN expressionList RPAREN SEMICOLON;

 msgHandlerSincCall:
         (SENDER | IDENTIFIER | listCall |functionCall)
         DOT IDENTIFIER {System.out.println("MsgHandlerSincCall:" + $IDENTIFIER.getText());} LPAREN expressionList RPAREN SEMICOLON;

 announceStmt:
        ANNOUNCE LT (IDENTIFIER | functionCall | listCall | listValue) GT COLON id=IDENTIFIER {System.out.println("Announcement:" + $id.getText());}
        LPAREN expressionList RPAREN SEMICOLON;

 main :
        MAIN LBRACE (actorInstantiation | varDec | mainStmt)* RBRACE;

 actorInstantiation:
      	IDENTIFIER id1=IDENTIFIER op=ASSIGN {System.out.println("Operator:" + $op.getText());} NEW id2=IDENTIFIER
      	{System.out.println("ActorInstantiation:" + $id1.getText() + ","+$id2.getText());} LPAREN (RPAREN | ((mainExpression) (COMMA (mainExpression))* RPAREN)) SEMICOLON;



 argDec :
        argDeclaration(COMMA argDeclaration)* |;

 argDeclaration:
        {System.out.print("ArgumentDec:");}
        ( primitiveType {System.out.print($primitiveType.text + ",");}
        | LIST LT (primitiveType | IDENTIFIER) GT {System.out.print($LIST.text + ",");}
        | IDENTIFIER {System.out.print($IDENTIFIER.text + ",");} )
        IDENTIFIER {System.out.println($IDENTIFIER.getText());};

 varDec :
        varDeclaration (COMMA IDENTIFIER {System.out.print("," + $IDENTIFIER.getText());})* {System.out.println();}SEMICOLON
        |varDeclaration {System.out.println();} ASSIGN expression SEMICOLON;

 varDeclaration:
 	    {System.out.print("VarDec:");}
 	    ( primitiveType {System.out.print($primitiveType.text + ",");}
        | LIST LT (primitiveType | IDENTIFIER) GT {System.out.print($LIST.text + ",");}
        | IDENTIFIER {System.out.print($IDENTIFIER.text + ",");} )
        IDENTIFIER {System.out.print($IDENTIFIER.getText());};


 expressionList:
 	    (expression(COMMA expression)* | );

 primitiveType : STRING | INT | BOOL;


 NEW: 'new';
 ACTOR : 'Actor';
 MSGHANDLER : 'msghandler';
 OBSERVER : 'observer';
 FUNC : 'func';
 STATEVARS : 'statevars';
 ANNOUNCE : 'announce';
 RETURN : 'return';

 CONSOLE_OUT : 'console_out';
 UNTIL : 'until';
 ELSE : 'else';
 IF : 'if';

 SENDER : 'sender';
 SELF : 'self';

 MAIN : 'main';

 STRING : 'string';
 BOOL : 'bool';
 INT : 'int';
 VOID : 'void';
 LIST : 'List';
 SIZE : 'size';
 ADD : 'add';
 HAS : 'has';
 REMOVE: 'remove';
 IGNORED : 'IGNORED';

 BREAK : 'break';

 STRINGVALUE : '"'~["]*'"';
 INTVALUE : [0] | [1-9]+[0-9]*;
 BOOLVALUE : 'true' | 'false';


 COMMA : ',';
 COLON : ':';
 SEMICOLON : ';';
 RBRACE : '}';
 LBRACE : '{';
 RPAREN : ')';
 LPAREN : '(';
 LBRACKET : '[';
 RBRACKET : ']';
 PLUS : '+';
 MINUS: '-';
 MULT: '*';
 DIV: '/';


 EQ: '==';
 NEQ: '!=';
 LT : '<';
 GT : '>';
 AND : '&&';
 OR : '||';
 NOT : '!';
 ASSIGN : '=';
 DOT : '.';

 ARROW : '->';
 ATSIGN : '@';

 WS : [ \t\r\n]+ -> skip;
 COMMENT : '//' -> skip;
 COMMENTLINE : COMMENT (~[\n\r])* -> skip;
 IDENTIFIER : [A-Za-z0-9]+;




