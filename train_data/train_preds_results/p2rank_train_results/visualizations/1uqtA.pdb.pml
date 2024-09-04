
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
        
        load "data/1uqtA.pdb", protein
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
 
        load "data/1uqtA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [133,118,119,122,123,138,2725,2726,126,130,66,68,2696,2698,64,2723,2724,2703,997,1000,1204,57,1011,1021,1022,1205,1206,59,2381,539,541,2379,51,53,61,2919,2921,2951,2952,2915,2923,2063,2929,2046,2920,1782,2903,2062,2061,2056,2359,2914,2109,2048,2051,2907,2908,2753,2064,616,617,2382,1203,1216,2893,1462,2899,2373] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.490,0.278,0.702]
select surf_pocket2, protein and id [2779,2709,2710,2031,2331,2671,2688,2777,2778,1942,2811,2812,2810,1919,1920,2013,2309,2310,2330,2648,2650,2011,2012] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.902,0.361,0.682]
select surf_pocket3, protein and id [662,2883,1486,3078,3081,3069,3089,3111,1228,1493,1482,1483,661,1222,1223,2881,1469,1494,3112,1468,2890,1249] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.408,0.278]
select surf_pocket4, protein and id [1775,3458,3459,3461,1758,1747,1748,1749,1753,3532,3533,3493,3494,3495,3566,1763] 
set surface_color,  pcol4, surf_pocket4 
   
        
        deselect
        
        orient
        