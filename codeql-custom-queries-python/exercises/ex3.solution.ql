import python
import semmle.python.ApiGraphs

from API::CallNode call
where call = API::moduleImport("os").getMember("system").getACall() and
call.getLocation().getFile().getRelativePath().regexpMatch("test-app/.*")
select call.getArg(0), "First argument of an `os.system` call"
