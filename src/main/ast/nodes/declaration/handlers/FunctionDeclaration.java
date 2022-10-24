package main.ast.nodes.declaration.handlers;

import main.ast.nodes.expression.Identifier;
import main.ast.types.Type;

//line -> identifier
public class FunctionDeclaration extends BaseFunctionDeclaration {
    protected Type returnType;

    public FunctionDeclaration(Identifier name, Type returnType) {
        this.name = name;
        this.returnType = returnType;
    }

    public Type getReturnType() {
        return returnType;
    }

    public void setReturnType(Type returnType) {
        this.returnType = returnType;
    }

    @Override
    public String toString() {
        return "FunctionDeclaration_" + this.name.getName();
    }
}
