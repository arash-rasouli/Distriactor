package main.visitor;

import main.ast.nodes.Program;
import main.ast.nodes.declaration.handlers.*;
import main.ast.nodes.declaration.*;
import main.ast.nodes.statement.*;
import main.ast.nodes.expression.values.primitive.*;
import main.ast.nodes.expression.values.*;
import main.ast.nodes.expression.*;

public interface IVisitor<T> {

    T visit(Program program);

    T visit(BaseFunctionDeclaration baseFunctionDeclaration);
    T visit(ConstructorDeclaration constructorDeclaration);
    T visit(FunctionDeclaration functionDeclaration);
    T visit(MsgHandlerDeclaration msgHandlerDeclaration);
    T visit(ObserverDeclaration observerDeclaration);
    T visit(ActorDeclaration actorDeclaration);
    T visit(AnnotationDeclaration annotationDeclaration);
    T visit(MainDeclaration mainDeclaration);
    T visit(VariableDeclaration variableDeclaration);

    T visit(AssignmentStmt assignmentStmt);
    T visit(BlockStmt blockStmt);
    T visit(ConditionalStmt conditionalStmt);
    T visit(ConsoleOutStmt consoleOutStmt);
    T visit(FunctionCallStmt functionCallStmt);
    T visit(ListAddStmt listAddStmt);
    T visit(ReturnStmt returnStmt);
    T visit(UntilStmt untilStmt);


    T visit(BinaryExpression binaryExpression);
    T visit(UnaryExpression unaryExpression);
    T visit(FunctionCall functionCallCall);
    T visit(Identifier identifier);
    T visit(ListAccessByIndex listAccessByIndex);
    T visit(ListSize listSize);

    T visit(IntValue intValue);
    T visit(BoolValue boolValue);
    T visit(StringValue stringValue);
    T visit(VoidValue voidValue);
    T visit(ListValue listValue);



}
