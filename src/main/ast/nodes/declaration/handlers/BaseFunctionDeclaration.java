package main.ast.nodes.declaration.handlers;

import main.ast.nodes.Node;
import main.ast.nodes.declaration.VariableDeclaration;
import main.ast.nodes.expression.Identifier;
import main.ast.nodes.statement.Statement;
import main.ast.types.Type;
import main.visitor.IVisitor;

import java.util.*;

//line -> identifier
public class BaseFunctionDeclaration extends Node {
    protected Identifier name;
    protected ArrayList<VariableDeclaration> args = new ArrayList<>();
    protected Statement body;


    public BaseFunctionDeclaration() {
    }

    public BaseFunctionDeclaration(Identifier name) {
        this.name = name;
    }

    public Identifier getName() {
        return name;
    }

    public void setName(Identifier name) {
        this.name = name;
    }

    public ArrayList<VariableDeclaration> getArgs() {
        return args;
    }

    public void setArgs(ArrayList<VariableDeclaration> args) {
        this.args = args;
    }

    public void addArg(VariableDeclaration arg) {
        this.args.add(arg);
    }

    public Statement getBody() {
        return body;
    }

    public void setBody(Statement body) {
        this.body = body;
    }

    @Override
    public String toString() {
        return null;
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return null;
    }
}
