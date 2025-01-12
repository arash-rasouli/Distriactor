package main.ast.nodes.statement;

import main.ast.nodes.expression.Expression;
import main.visitor.IVisitor;

//line -> until
public class UntilStmt extends Statement{
    private Expression condition;
    private Statement body;

    public Expression getCondition() {
        return condition;
    }
    public void setCondition(Expression condition) {
        this.condition = condition;
    }

    public Statement getBody() {
        return body;
    }
    public void setBody(Statement body) {
        this.body = body;
    }

    @Override
    public String toString() {
        return "UntilStmt";
    }

    @Override
    public <T> T accept(IVisitor<T> visitor) {
        return visitor.visit(this);
    }
}
