package main.ast.nodes.expression;

import main.ast.nodes.statement.Statement;
import main.visitor.IVisitor;

public class ListSize extends Statement {
    private Expression arg;

    public ListSize(Expression arg) {
        this.arg = arg;
    }

    public void setArg(Expression arg) { this.arg = arg; }
    public Expression getArg() {
        return arg;
    }

    @Override
    public String toString() {
        return "SizeStmt";
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
