/**
 * @name Command injection in os.system sink
 * @kind path-problem
 * @id codeql-ws/dataflow-query
 */

 import python
 import semmle.python.dataflow.new.DataFlow
 import semmle.python.dataflow.new.TaintTracking
 import semmle.python.ApiGraphs
 import semmle.python.dataflow.new.RemoteFlowSources
 import MyFlow::PathGraph

 class OsSystemSink extends API::CallNode {
   OsSystemSink() {
     this = API::moduleImport("os").getMember("system").getACall()
   }
 }

 private module MyConfig implements DataFlow::ConfigSig {
 predicate isSource(DataFlow::Node source) {
   source instanceof RemoteFlowSource
 }

 predicate isSink(DataFlow::Node sink) {
   exists(OsSystemSink call |
   sink = call.getArg(0)
   )
 }
 }

 module MyFlow = TaintTracking::Global<MyConfig>;

 from MyFlow::PathNode source, MyFlow::PathNode sink
 where MyFlow::flowPath(source, sink)
 select sink.getNode(), source, sink, "Command injection"
