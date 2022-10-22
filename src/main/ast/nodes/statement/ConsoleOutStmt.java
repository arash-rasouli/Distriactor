package main.ast.nodes.statement;

import main.ast.nodes.expression.Expression;
import main.visitor.IVisitor;

//Line -> DISPLAY
public class ConsoleOutStmt extends Statement{
    private Expression arg;

    public ConsoleOutStmt(Expression arg) {
        this.arg = arg;
    }

    public Expression getArg() {
        return arg;
    }

    public void setArg(Expression arg) {
        this.arg = arg;
    }

    @Override
    public String toString() {
        return "ConsoleOutStmt";
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
