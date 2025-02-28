import python
import semmle.python.ApiGraphs

from API::CallNode call
where call //TODO: fill me in
and
call.getLocation().getFile().getRelativePath().regexpMatch("test-app/.*")
select call, "Call to `os.system`"
