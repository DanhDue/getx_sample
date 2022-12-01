// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'model_visitor.dart';

class D3FBaseResponseJsonToTGenerator
    extends GeneratorForAnnotation<D3FBaseResponseJsonToTAnnotation> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    final classBuffer = StringBuffer();
    // gen jsonToT method for single object.
    classBuffer
        .writeln('''${visitor.className}? jsonToNullable${visitor.className}(Object? json) =>
            ${visitor.className}.fromJson(json as Map<String, dynamic>);\n''');

    classBuffer.writeln('''${visitor.className} jsonTo${visitor.className}(Object? json) => 
            ${visitor.className}.fromJson(json as Map<String, dynamic>);\n''');

    // gen the jsonToT method for list of objects.
    classBuffer.writeln(
        '''List<${visitor.className}?> jsonToListNullable${visitor.className}s(Object? json) =>
                      List<Object>.from(json as List)
                        .map((e) => ${visitor.className}.fromJson(e as Map<String, dynamic>))
                        .toList();\n''');

    classBuffer
        .writeln('''List<${visitor.className}> jsonToList${visitor.className}s(Object? json) =>
                      List<Object>.from(json as List)
                        .map((e) => ${visitor.className}.fromJson(e as Map<String, dynamic>))
                        .toList();''');
    return classBuffer.toString();
  }
}
