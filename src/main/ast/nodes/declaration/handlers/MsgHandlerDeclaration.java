package main.ast.nodes.declaration.handlers;

import main.ast.nodes.declaration.AnnotationDeclaration;
import main.ast.nodes.expression.Identifier;
import main.ast.types.Type;

import java.util.ArrayList;

public class MsgHandlerDeclaration extends FunctionDeclaration{
    protected ArrayList<AnnotationDeclaration> annotations = new ArrayList<>();

    public MsgHandlerDeclaration(Identifier name, Type returnType) {
        super(name, returnType);
    }

    public void addAnnotation(AnnotationDeclaration annotation) {
        annotations.add(annotation);
    }

    public void setAnnotations(ArrayList<AnnotationDeclaration> annotations) {
        this.annotations = annotations;
    }

    @Override
    public String toString() {
        return "MsgHandlerDeclaration_" + this.name.getName();
    }
}