import python
import semmle.python.dataflow.new.RemoteFlowSources

from RemoteFlowSource rfs
where rfs.getLocation().getFile().getRelativePath().regexpMatch("test-app/.*")
select rfs
