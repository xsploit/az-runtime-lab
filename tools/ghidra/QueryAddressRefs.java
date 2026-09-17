// @category AZResearch
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Function;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.ReferenceIterator;

/** Read existing analysis only. Arguments: absolute program address, limit 1..200. */
public class QueryAddressRefs extends GhidraScript {
    public void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 2) throw new IllegalArgumentException("Expected address and limit");
        int limit = Integer.parseInt(args[1]);
        if (limit < 1 || limit > 200) throw new IllegalArgumentException("Limit must be 1..200");
        Address target = currentProgram.getAddressFactory().getAddress(args[0]);
        if (target == null || !currentProgram.getMemory().contains(target))
            throw new IllegalArgumentException("Address is not mapped: " + args[0]);
        println("QUERY program=" + currentProgram.getName() + " base=" + currentProgram.getImageBase()
            + " language=" + currentProgram.getLanguageID() + " address=" + target);
        Function owner = currentProgram.getFunctionManager().getFunctionContaining(target);
        println("OWNER " + (owner == null ? "unknown" : owner.getEntryPoint() + " " + owner.getName()));
        ReferenceIterator refs = currentProgram.getReferenceManager().getReferencesTo(target);
        int count = 0;
        while (count < limit && refs.hasNext()) {
            monitor.checkCancelled();
            Reference ref = refs.next();
            Function caller = currentProgram.getFunctionManager().getFunctionContaining(ref.getFromAddress());
            println("REF from=" + ref.getFromAddress() + " type=" + ref.getReferenceType()
                + " source=" + ref.getSource() + " owner="
                + (caller == null ? "unknown" : caller.getEntryPoint() + " " + caller.getName()));
            count++;
        }
        println("END returned=" + count + " truncated=" + refs.hasNext()
            + " scope=existing-analysis-references-only");
    }
}
