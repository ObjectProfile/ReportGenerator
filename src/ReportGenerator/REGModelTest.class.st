Class {
	#name : #REGModelTest,
	#superclass : #REGTest,
	#category : #ReportGenerator
}

{ #category : #'as yet unclassified' }
REGModelTest >> codeCPP [

^ '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<unit xmlns="http://www.srcML.org/srcML/src" xmlns:cpp="http://www.srcML.org/srcML/cpp" revision="1.0.0" language="C++" filename="main.cpp"><comment type="line">// classes example</comment>
<cpp:include>#<cpp:directive>include</cpp:directive> <cpp:file>&lt;iostream&gt;</cpp:file></cpp:include>
<using>using <namespace>namespace <name>std</name>;</namespace></using>

<class>class <name>Rectangle</name> <block>{<private type="default">
    <decl_stmt><decl><type><name>int</name></type> <name>width</name></decl>, <decl><type ref="prev"/><name>height</name></decl>;</decl_stmt>
  </private><public>public:
    <function_decl><type><name>void</name></type> <name>set_values</name> <parameter_list>(<parameter><decl><type><name>int</name></type></decl></parameter>,<parameter><decl><type><name>int</name></type></decl></parameter>)</parameter_list>;</function_decl>
    <function><type><name>int</name></type> <name>area</name><parameter_list>()</parameter_list> <block>{<block_content><return>return <expr><name>width</name><operator>*</operator><name>height</name></expr>;</return></block_content>}</block></function>
</public>}</block>;</class>

<function><type><name>void</name></type> <name><name>Rectangle</name><operator>::</operator><name>set_values</name></name> <parameter_list>(<parameter><decl><type><name>int</name></type> <name>x</name></decl></parameter>, <parameter><decl><type><name>int</name></type> <name>y</name></decl></parameter>)</parameter_list> <block>{<block_content>
  <expr_stmt><expr><name>width</name> <operator>=</operator> <name>x</name></expr>;</expr_stmt>
  <expr_stmt><expr><name>height</name> <operator>=</operator> <name>y</name></expr>;</expr_stmt>
</block_content>}</block></function>

<function><type><name>int</name></type> <name>main</name> <parameter_list>()</parameter_list> <block>{<block_content>
  <decl_stmt><decl><type><name>Rectangle</name></type> <name>rect</name></decl>;</decl_stmt>
  <expr_stmt><expr><call><name><name>rect</name><operator>.</operator><name>set_values</name></name> <argument_list>(<argument><expr><literal type="number">3</literal></expr></argument>,<argument><expr><literal type="number">4</literal></expr></argument>)</argument_list></call></expr>;</expr_stmt>
  <expr_stmt><expr><name>cout</name> <operator>&lt;&lt;</operator> <literal type="string">"area: "</literal> <operator>&lt;&lt;</operator> <call><name><name>rect</name><operator>.</operator><name>area</name></name><argument_list>()</argument_list></call></expr>;</expr_stmt>
  <expr_stmt><expr><name>cout</name> <operator>&lt;&lt;</operator> <literal type="string">"\n"</literal></expr>;</expr_stmt>
  <return>return <expr><literal type="number">0</literal></expr>;</return>
</block_content>}</block></function>

</unit>
'
]

{ #category : #'as yet unclassified' }
REGModelTest >> codeCppLint [
^ 'Ignoring /Users/alexandrebergel/Dropbox/GitRepos/u-vent/Bambu_ventilator.ino; not a valid file name (cuh, cxx, cu, hpp, cc, c, hxx, hh, h++, cpp, h, c++)
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:0:  No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:1:  Weird number of spaces at line-start.  Are you using a 2-space indent?  [whitespace/indent] [3]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:1:  Line ends in whitespace.  Consider deleting these extra spaces.  [whitespace/end_of_line] [4]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:9:  Use int16/int64/etc, rather than the C type long  [runtime/int] [4]
/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp:10:  Use int16/int64/etc, rather than the C type long  [runtime/int] [4]'
]

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
REGModelTest >> testCPP [

	| m moduleMain |
	m := REGModel new.
	m addSrcMLXML: self codeCPP.

	moduleMain := m modules first.
	self assert: moduleMain filename equals: 'main.cpp'.
	self assert: (moduleMain numberOfIncludes) equals: 1.
	self assert: (moduleMain includes collect: #name) asArray equals: #('<iostream>').
	m resolve.
	
	self assert: (m headers isEmpty).
	self assert: m numberOfClasses equals: 1
]

{ #category : #'tests - cpplint' }
REGModelTest >> testCppLint [

	| rules r |
	rules := REGCppLintRules new fromString: self codeCppLint.
	
	self assert: rules size equals: 5.
	
	r := rules first. 
	self assert: r file equals: '/Users/alexandrebergel/Dropbox/GitRepos/u-vent/DumbSpeedControl.cpp'.
	self assert: r lineOfCode equals: 0.
	self assert: r description equals: 'No copyright message found.  You should have a line: "Copyright [year] <Copyright Owner>"  [legal/copyright] [5]'.
]

{ #category : #tests }
REGModelTest >> testEmpty [

	| m |
	m := REGModel new.
	self assert: m numberOfModules equals: 0.	
	self assert: m numberOfFunctions equals: 0.
]

{ #category : #tests }
REGModelTest >> testImport [

	| m moduleMain header |
	m := REGModel new.
	m addSrcMLXML: self codeExample.

	moduleMain := m modules first.
	self assert: moduleMain filename equals: 'main.c'.
	self assert: (moduleMain numberOfIncludes) equals: 2.
	self assert: (moduleMain includes collect: #name) asArray equals: #('<stdio.h>' '"myOtherModule.h"').
	m resolve.
	
	header := m headers first.
	self assert: (moduleMain doesInclude: header)
	
]
