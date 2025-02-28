import python
import semmle.python.ApiGraphs

class OsSystemSink extends API::CallNode {
	OsSystemSink() {
		this = API::moduleImport("os").getMember("system").getACall()
	}
}


from API::CallNode call
where call instanceof OsSystemSink
and call.getLocation().getFile().getRelativePath().regexpMatch("test-app/.*")
select call.getArg(0), "Call to os.system"
