
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
        
        load "data/3nvdA.pdb", protein
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
 
        load "data/3nvdA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [3195,3196,3197,4540,1658,1548,1550,1009,1047,1049,1050,4498,4508,4915,4933,489,4539,4934,1625,1626,2533,2534,2535,2475,1549,1580,3017,3039,3040,4499] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [1290,5830,5833,5930,5931,5933,5829,1289,2199,2173,5929,1336,5743,1333,1334,1335,1337,5793,5796,2232,1275,2200,2201,2202,5712,5736,5741,5809,5810,5802,2229,2931,2947,2160,2161,2162,2163,2164,2170,2171] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [5542,5557,5620,5541,4409,5621,71,72,5693,5695,5559,5543,4410,88,89,92,24,4420,4421,3653,3645,3646,4408] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [8856,6232,6233,6234,8852,6219,8906,8909,6217,6218,8854,8908,6163,6227,6230,6231,6307,6113,6164,6166,6167,8848,8820,8829,8851,8954,8955,8956,8858,6940,8966,8967,6988,6989,6991,6941,9006,9004] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [5449,5452,5453,5505,5517,5562,5502,5503,4413,4311,4253,4338,4313,4312,4845,4847,4177,4252,5454,5455,5456] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [4054,4645,4646,3232,3236,3786,3235] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        