
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
        
        load "data/1ffqA.pdb", protein
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
 
        load "data/1ffqA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1923,1924,1926,2274,1916,1919,1933,1925,1938,3470,3469,1381,1382,1383,1939,1387,2252,2275,2829,2831,2832,2284,1928,1929,1930,1931,2305,2640,2645,2644,3071,2286,2285,2670,2678,2679,2309,2650,2651,3246,3489,3490,3467,3994,3996,3998,2858,3247,3248,3250,3251,3252,2898,2854,2855,2856,3266,2862,2899,2900,2901,2828,2842,3066,2865,3068,3070,1069,1070,1072,1073,1075,1068,1071,1074,1076,1561,1563,1395,1398,1402,1397,1396,1427,1267,1269,1270,3997,3999,4000,4001,4002,1263,1065,1064,1098,1063,1569,1570,1572,4010,4012,1113,4011,3504,3454] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [481,500,494,497,319,502,507,480,538,512,528,532] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        