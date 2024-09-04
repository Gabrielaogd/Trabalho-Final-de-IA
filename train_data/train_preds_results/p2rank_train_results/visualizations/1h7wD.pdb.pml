
        from pymol import cmd,stored
        
        set depth_cue, 1
        set fog_start, 0.4
        
        set_color b_col, [36,36,85]
        set_color t_col, [10,10,10]
        set bg_rgb_bottom, b_col
        set bg_rgb_top, t_col      
        set bg_gradient
        
        set  spec_power  =  200
        set  spec_refl   =  0
        
        load "data/1h7wD.pdb", protein
        create ligands, protein and organic
        select xlig, protein and organic
        delete xlig
        
        hide everything, all
        
        color white, elem c
        color bluewhite, protein
        #show_as cartoon, protein
        show surface, protein
        #set transparency, 0.15
        
        show sticks, ligands
        set stick_color, magenta
        
        
        
        
        # SAS points
 
        load "data/1h7wD.pdb_points.pdb.gz", points
        hide nonbonded, points
        show nb_spheres, points
        set sphere_scale, 0.2, points
        cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)
        
        
        stored.list=[]
        cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
        lastSTP=stored.list[-1] # get the index of the last residue
        hide lines, resn STP
        
        cmd.select("rest", "resn STP and resi 0")
        
        for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))
        
        
        
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [27923,27485,27662,28879,28883,28884,28885,27481,28701,28384,28397,28398,28696,28385,28387,28388,28389,28394,28393,29442,29468,29469,27921,27922,27924,27488,27489,27493,27941,27936,27944,27945,27950,27956,27943,28396,27937,27939,29293,29296,29437,29441,29424,28874,29284,29285,27477,27483,27668,28889,28891,28731,28901,28904,28905,28714,28715,28716,28728,28505,28486,28503,28504,29072,27920,29074,27926,28892,29073,29075,29061,27902,28880,28881,29289,29091,29089,29090,29286,29290,29291] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.376,0.702]
select surf_pocket2, protein and id [24960,24961,24732,25411,24731,24969,25410,25420,25421,25413,25414,25415,25416,25418,25424,25607,26623,26624,25426,25427,25428,25433,25435,25436,25437,26619,26622,24741,24750,24959,24907,24916,26658,24908,24892,24925,24913,24915,24923,24924,24926,26998,26999,27003,27031,26990,26993,26994,26997,26953,26954,26955,25430,27030,26945,26948,26952,26943,24749,24751,24755,27000,25244,26681,25241,25245,25236,25846,24967,24968,24970,25634,24994,24997,24998,25850,25851,25855,25608,26995,24252,27008,25000,25004,25006,24999,25640,25641,25603,25606,24944,24946,24988,24989,25847,25848,25849,26991,24262,24267,24251,24265,27002,26616,25880,26111,26113,26114,26090,25042] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.392,0.902]
select surf_pocket3, protein and id [29100,29101,29307,29308,29123,29290,29291,29314,27880,27887,29095,29289,29092,23860,27869,27873,27874,27875,27876,29477,23862,24072,23858,23898,23863,23861,23864,29452,29474,29453,29296,29447,24081,24082,29304,29313,29518,29305,24054,23896,23897,29485,29483,29482,24074] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.329,0.278,0.702]
select surf_pocket4, protein and id [29814,29815,24477,24478,24479,24480,25078,23739,23741,23738,23758,25058,25057,23782,23786,24449,29799,25079,24476,24512,29739,24474,24475,29745,23792,24456,24458,24487,29738,29740,29741,24481,24482,29747,23795,23799,23802,23804,29756,29772,29775,29777,29773,29774,29776,29796,23808,29753,29757,30861,29752,24507] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.514,0.361,0.902]
select surf_pocket5, protein and id [30592,30594,30793,30597,30809,30794,30776,30777,30775,30784,30658,30814,30656,30748,30598] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.471,0.278,0.702]
select surf_pocket6, protein and id [26055,25838,26072,26074,26075,26076,26025,26026,26027,26028,26014,26016,26605,26608,26610,26612,26614,26616,26602,26606,26607,26246,25478,25846,25842,25850,25855,26995,25839,26994,25463,26619,25831,25833,25837,25829,25830,25995,26010,26021,26236,25828,26253] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.698,0.361,0.902]
select surf_pocket7, protein and id [23774,23775,24406,23755,23756,24243,26103,23759,23751,23763,26139,25040,25042,24395,24308,24404,24405,24401,24279,26090,26102,26106,26100,26107,26101,26108,26138,26111,26114,24274,24273,24258,24262,24249,24250,24251,24265,24239,24417,24309] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.616,0.278,0.702]
select surf_pocket8, protein and id [23811,23812,30531,30856,29787,29788,29789,29790,29791,29796,29792,29771,29775,29777,30514,29776,23790,23779,23791,23816,23815,23795,23792] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.886,0.361,0.902]
select surf_pocket9, protein and id [24323,24324,24319,23928,23904,23934,23935,23881,23899,24018,24014,24015,23922,24397,24396] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.639]
select surf_pocket10, protein and id [29569,29531,29561,27357,27359,29589,27430,27352,27599,29529,27442,27602,27604,29562,27434,27431,29532,27275,29533,27327,27325,29590,27340,24145,24146,27297] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.729]
select surf_pocket11, protein and id [24439,24440,24260,24259,24295,24301,24302,24293,24297,23965,23978,23972,23961] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.494]
select surf_pocket12, protein and id [23662,26171,23668,29812,23730,30027,30025,23689,23713,23714,30029,23676,23687,23688,23667,29828,29829,23731,23733,30028,29782,26162,26157,26159,26160,29964,29988,30002,30003,29996,29999,30000,30001,29998,29992,29922,29991,23737,23729,23743,23746,23748,23745] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.545]
select surf_pocket13, protein and id [30541,30546,30547,30565,30520,30524,30878,30733,30734,30525,30841,30848,30847] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.353]
select surf_pocket14, protein and id [29381,29383,29384,29640,30320,30357,30319,30321,30326,29714,29716,29717,29352,29380,30330,30327,29323,29325,29346,29637,29638,29639,30303,30322,29603,29599] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.361]
select surf_pocket15, protein and id [25697,30124,30127,30128,25677,25675,25740,23719,23705,23721,25680,25681,25679,25744,30084,30086,30087,23706,30089,30083,30091,23702] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.353,0.278]
select surf_pocket16, protein and id [29235,29236,29250,29237,29238,29392,30309,30311,29405,30312,29394,29251,30308,29202,30337,29203,30314,30315,30316,29200] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.545,0.361]
select surf_pocket17, protein and id [27131,27212,27215,27130,27208,24680,27166,27167,27168,24678,24648,24655,24647,24606,24607,27218,27222,27223,27252,27267,24600,24831,24835,27100,27248] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.494,0.278]
select surf_pocket18, protein and id [25138,25128,25163,24937,24930,24948,24954,25101,25070,25701,25705,24940,25094,25095] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.729,0.361]
select surf_pocket19, protein and id [27046,27053,26981,23967,23970,27022,27021,27025,26987,26835,26837,26838,26863,26969,27072,27073] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.639,0.278]
select surf_pocket20, protein and id [23562,23563,23565,23566,23528,23503,23564,23567,23568,23382,30718,30719,23561] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.886,0.902,0.361]
select surf_pocket21, protein and id [24153,24154,27275,27276,29533,29536,29569,24179,24145] 
set surface_color,  pcol21, surf_pocket21 
   
        
        deselect
        
        orient
        