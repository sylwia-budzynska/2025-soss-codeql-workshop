/**
 * @name Command injection in os.system sink
 * @kind path-problem
 * @id codergirls/dataflow-query
 */

 import python
 import semmle.python.dataflow.new.DataFlow
 import semmle.python.dataflow.new.TaintTracking
 import semmle.python.ApiGraphs
 import MyFlow::PathGraph
 import semmle.python.dataflow.new.RemoteFlowSources

 //TODO: add previous class definition here

 private module MyConfig implements DataFlow::ConfigSig {
   predicate isSource(DataFlow::Node source) {
	 // TODO: fill me in
   }

   predicate isSink(DataFlow::Node sink) {
	 // TODO: fill me in. Use the `exists` mechanism
	   exists(<type> <variable> |
	   sink = //TODO: fill me in
   )
   }
 }

 module MyFlow = TaintTracking::Global<MyConfig>;

 from MyFlow::PathNode source, MyFlow::PathNode sink
 where MyFlow::flowPath(source, sink)
 select sink.getNode(), source, sink, "Command injection"
