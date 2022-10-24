package main.ast.nodes.declaration;

import main.ast.nodes.declaration.handlers.ConstructorDeclaration;
import main.ast.nodes.declaration.handlers.FunctionDeclaration;
import main.ast.nodes.expression.Identifier;
import main.visitor.IVisitor;

import java.util.ArrayList;
//line -> CLASS
public class ActorDeclaration extends Declaration {
    private Identifier name;
    private ArrayList<VariableDeclaration> vars = new ArrayList<>();
    private ConstructorDeclaration constructor;
    private ArrayList<FunctionDeclaration> functions = new ArrayList<>();

    public ActorDeclaration(Identifier actorName) {
        this.name = actorName;
    }

    public Identifier getName() {
        return name;
    }

    public void setName(Identifier name) {
        this.name = name;
    }

    public ConstructorDeclaration getConstructor() {
        return constructor;
    }

    public void setConstructor(ConstructorDeclaration constructor) {
        this.constructor = constructor;
    }

    public ArrayList<FunctionDeclaration> getFunctions() {
        return functions;
    }

    public void setFunctions(ArrayList<FunctionDeclaration> functions) {
        this.functions = functions;
    }

    public ArrayList<VariableDeclaration> getVars() {
        return vars;
    }

    public void setVars(ArrayList<VariableDeclaration> vars) {
        this.vars = vars;
    }

    public void addMethod(FunctionDeclaration methodDeclaration) {
        this.functions.add(methodDeclaration);
    }

    public void addField(VariableDeclaration varDeclaration) {
        this.vars.add(varDeclaration);
    }

    @Override
    public String toString() {
        return "ActorDeclaration_" + this.name.getName();
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return visitor.visit(this);
    }
}