import python
import semmle.python.ApiGraphs

class OsSystemSink extends API::CallNode {
	OsSystemSink() {
		//TODO: fill me in
	}
}

from API::CallNode call
where // TODO: fill me in
and call.getLocation().getFile().getRelativePath().regexpMatch("test-app/.*")
select call.getArg(0), "Call to os.system"
