package main.ast.nodes.statement;

import main.ast.nodes.expression.Expression;
import main.visitor.IVisitor;

public class ListAddStmt extends Statement{
    private Expression listArg;
    private Expression elementArg;

    public ListAddStmt(Expression listArg, Expression elementArg) {
        this.listArg = listArg;
        this.elementArg = elementArg;
    }

    public void setListArg(Expression listArg) { this.listArg = listArg; }
    public Expression getListArg() { return listArg; }

    public void setElementArg(Expression elementArg) { this.elementArg = elementArg; }
    public Expression getElementArg() {
        return elementArg;
    }

    @Override
    public String toString() {
        return "AppendStmt";
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
