package main.ast.nodes.declaration.handlers;

import main.ast.nodes.expression.Identifier;
import main.ast.types.NullType;
import main.visitor.IVisitor;

//line -> INITIALIZE
public class ConstructorDeclaration extends FunctionDeclaration {
    public ConstructorDeclaration(Identifier className) {
        super(className, new NullType());
    }

    @Override
    public String toString() {
        return "ConstructorDeclaration";
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
