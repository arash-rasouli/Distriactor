package main.ast.nodes.declaration.handlers;

public class ObserverDeclaration extends BaseFunctionDeclaration {

    @Override
    public String toString() {
        return "ObserverDeclaration_" + this.name.getName();
    }
}
