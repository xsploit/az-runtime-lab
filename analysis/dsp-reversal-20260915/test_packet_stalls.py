"""Synthetic scheduling cases: no firmware instructions or payload fixtures."""
import unittest
from packet_stalls import stall_cost
from group_packets import packets


def packet(*instructions):
    return {'packet_start':'0x1000', 'instructions':[
        dict(mnemonic=op, operands=operand, predicate=predicate)
        for op,operand,predicate in instructions]}


class StallTests(unittest.TestCase):
    def test_header_protects_compact_and_full_loads(self):
        rows = packets(['00001000 1234 LDW.D1 *A1,A2',
                        '00001002 12345678 LDHU.D2 *B1,B2',
                        '0000101c e0100000 .fphead p, l'])
        self.assertEqual([stall_cost(p)['local_issue_span'] for p in rows],[5,5])
        plain = packets(['00001000 1234 LDW.D1 *A1,A2',
                         '0000101c e0000000 .fphead n, l'])
        self.assertEqual(stall_cost(plain[0])['local_issue_span'],1)

    def test_predicate_does_not_cancel_bnops(self):
        for predicate in (None,'[A0]','[!A0]'):
            self.assertEqual(stall_cost(packet(('BNOP.S1','0x2000,3',predicate)))['local_issue_span'],4)

    def test_parallel_costs_not_added(self):
        p=packet(('BNOP.S1','0x2000,3','[A0]'),('NOP','2',None))
        self.assertEqual(stall_cost(p)['local_issue_span'],4)

    def test_call_has_no_callee_duration(self):
        result=stall_cost(packet(('CALLP.S2','0x2000,B3',None)))
        self.assertEqual(result['local_issue_span'],6)
        self.assertIn('callee',result['notes'][0])

    def test_path_dependent_and_loop_cases_rejected(self):
        for op,operand in [('BNOP.S1','0x2000,7'),('SPLOOPD','4')]:
            with self.assertRaises(ValueError):stall_cost(packet((op,operand,None)))


if __name__ == '__main__': unittest.main()
