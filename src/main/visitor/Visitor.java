package main.visitor;

import main.ast.nodes.Program;
import main.ast.nodes.declaration.handlers.*;
import main.ast.nodes.declaration.*;
import main.ast.nodes.statement.*;
import main.ast.nodes.expression.values.primitive.*;
import main.ast.nodes.expression.values.*;
import main.ast.nodes.expression.*;

public class Visitor<T> implements IVisitor<T> {

    @Override
    public T visit(Program program) {
        return null;
    }

    @Override
    public T visit(BaseFunctionDeclaration baseFunctionDeclaration) {
        return null;
    }
    @Override
    public T visit(ConstructorDeclaration constructorDeclaration) {
        return null;
    }
    @Override
    public T visit(FunctionDeclaration functionDeclaration) {
        return null;
    }
    @Override
    public T visit(MsgHandlerDeclaration msgHandlerDeclaration) {
        return null;
    }
    @Override
    public T visit(ObserverDeclaration observerDeclaration) {
        return null;
    }
    @Override
    public T visit(ActorDeclaration actorDeclaration) {
        return null;
    }
    @Override
    public T visit(AnnotationDeclaration annotationDeclaration) {
        return null;
    }
    @Override
    public T visit(MainDeclaration mainDeclaration) {
        return null;
    }
    @Override
    public T visit(VariableDeclaration variableDeclaration) {
        return null;
    }


    @Override
    public T visit(AssignmentStmt assignmentStmt) {
        return null;
    }
    @Override
    public T visit(BlockStmt blockStmt) {
        return null;
    }
    @Override
    public T visit(ConditionalStmt conditionalStmt) {
        return null;
    }
    @Override
    public T visit(ConsoleOutStmt consoleOutStmt) {
        return null;
    }
    @Override
    public T visit(FunctionCallStmt functionCallStmt) {
        return null;
    }
    @Override
    public T visit(ListAddStmt listAddStmt) {
        return null;
    }
    @Override
    public T visit(ReturnStmt returnStmt) {
        return null;
    }
    @Override
    public T visit(UntilStmt untilStmt) {
        return null;
    }

    @Override
    public T visit(BinaryExpression binaryExpression) {
        return null;
    }
    @Override
    public T visit(UnaryExpression unaryExpression) {
        return null;
    }
    @Override
    public T visit(FunctionCall functionCallCall) {
        return null;
    }
    @Override
    public T visit(Identifier identifier) {
        return null;
    }
    @Override
    public T visit(ListAccessByIndex listAccessByIndex) {
        return null;
    }
    @Override
    public T visit(ListSize listSize) {
        return null;
    }

    @Override
    public T visit(IntValue intValue) {
        return null;
    }
    @Override
    public T visit(BoolValue boolValue) {
        return null;
    }
    @Override
    public T visit(StringValue stringValue) {
        return null;
    }
    @Override
    public T visit(VoidValue voidValue) {
        return null;
    }
    @Override
    public T visit(ListValue listValue) {
        return null;
    }
}
