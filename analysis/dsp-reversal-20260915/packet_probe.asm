    .text
    .global packet_probe
packet_probe:
    MVK.S2 22,B0
 || ADD.L2 B0,-1,B1
    BNOP.S2 B3,5
