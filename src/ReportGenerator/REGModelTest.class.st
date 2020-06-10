Class {
	#name : #REGModelTest,
	#superclass : #REGTest,
	#category : #ReportGenerator
}

{ #category : #'as yet unclassified' }
REGModelTest >> codeExample [

^'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" revision="1.0.0">

<unit xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="main.c" hash="e2d0f7ce5cefebadcf4ee32889129453c60aaf16"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;stdio.h&gt;</cpp:file></cpp:include>

<cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>"myOtherModule.h"</cpp:file></cpp:include>

<function><type><name>int</name></type> <name>main</name><parameter_list>()</parameter_list> <block>{<block_content>
  <expr_stmt><expr><call><name>printf</name><argument_list>(<argument><expr><literal type="string">"Hello World!\n"</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
  <return>return <expr><literal type="number">0</literal></expr>;</return>
</block_content>}</block></function>
</unit>

<unit xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="myOtherModule.c" hash="3eda10fdf9dc0fd6d6ac778fb6ae2bda1aea9083"><cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;stdio.h&gt;</cpp:file></cpp:include>

<cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>"myOtherModule.h"</cpp:file></cpp:include>


<comment type="block">/*
   this is a comment
*/</comment>

<function><type><name>void</name></type> <name>foo</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list> <block>{<block_content>
  <expr_stmt><expr><call><name>printf</name><argument_list>(<argument><expr><literal type="string">"Hello World!\n"</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
</block_content>}</block></function>
</unit>

<unit xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C" filename="myOtherModule.h" hash="1f0eb46e6820e7c193fdb8d7953f90016894cf01"><cpp:ifndef>#<cpp:directive>ifndef</cpp:directive> <name>MYOTHERMODULE_H</name></cpp:ifndef>
<cpp:define>#<cpp:directive>define</cpp:directive> <cpp:macro><name>MYOTHERMODULE_H</name></cpp:macro></cpp:define>

<function_decl><type><name>void</name></type> <name>foo</name><parameter_list>(<parameter><decl><type><name>void</name></type></decl></parameter>)</parameter_list>;</function_decl>

<cpp:endif>#<cpp:directive>endif</cpp:directive></cpp:endif>

</unit>

</unit>
'
]

{ #category : #'as yet unclassified' }
REGModelTest >> codeMain [

^ '#include <stdio.h>

#include "myOtherModule.h"

int main() {
  printf("Hello World!\n");
  return 0;
}
'
]

{ #category : #'as yet unclassified' }
REGModelTest >> codeMyOtherModule [

^ '#ifndef MYOTHERMODULE_H
#define MYOTHERMODULE_H

void foo(void);

#endif

'
]

{ #category : #'as yet unclassified' }
REGModelTest >> codeMyOtherModuleC [

^ '#include <stdio.h>

#include "myOtherModule.h"


/*
   this is a comment
*/

void foo(void) {
  printf("Hello World!\n");
}
'
]

{ #category : #tests }
REGModelTest >> testAddExample [

	| m |
	m := REGModel new.
	m addSrcMLXML: self codeExample.
	
	self assert: m numberOfModules equals: 2.	
		
	self assert: m modules size equals: 2.
	self assert: m modules first filename equals: 'main.c'.
	self assert: m modules second filename equals: 'myOtherModule.c'.
	self assert: m modules first functions size equals: 1.
	
	self assert: m numberOfFunctions equals: 2.
	self assert: m numberOfHeaders equals: 1.
	
	self assert: m modules first numberOfLinesOfCode equals: 9.
	self assert: m numberOfLinesOfCode equals: 30.
]

{ #category : #tests }
REGModelTest >> testEmpty [

	| m |
	m := REGModel new.
	self assert: m numberOfModules equals: 0.	
	self assert: m numberOfFunctions equals: 0.
]
