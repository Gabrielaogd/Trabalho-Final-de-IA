
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
        
        load "data/3i5xA.pdb", protein
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
 
        load "data/3i5xA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [297,557,295,296,298,300,3038,324,326,541,545,546,555,536,348,349,528,529,532,868,869,870,871,894,896,279,516,522,525,527,518,519,520,3039,3035,3036,3040,539,540,1733,840,2789,2790,2792,1435,817,1436,1427,2805,2806,2807,2808,3030,3031,2824,2825,838,3008] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.298,0.702]
select surf_pocket2, protein and id [1218,1219,1220,1222,1223,797,799,800,1033,1208,1209,1229,1230,1036,1037,1506,1508,1543,781,1217,1210] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.533,0.361,0.902]
select surf_pocket3, protein and id [402,1394,1690,1692,408,409,410,1689,1691,1671,419,425,659,1379,1380,1381,632,634,1383,1382,1674,666] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.565,0.278,0.702]
select surf_pocket4, protein and id [505,506,507,1987,1988,1997,522,525,527,520,3035,3036,3040,2006,501,3038,324,326,332,333] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.878]
select surf_pocket5, protein and id [1742,1743,3228,3229,1449,1445,1482,1483,1485,1446,2925,2938,2921,2926,2934,3607,2923,1740,1741] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.278,0.533]
select surf_pocket6, protein and id [2053,2038,2039,3290,3291,3292,3081,2167,2169,2194,2195,2196,3067,3068,2859,2024,2205,2230] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.490]
select surf_pocket7, protein and id [2640,2679,2680,2681,806,832,826,833,827,862,871,2639,2617,2643,2646,2648,2647,828,2615,2620] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.329,0.278]
select surf_pocket8, protein and id [884,885,886,1001,1002,1116,911,913,998,1148,966,994,997,967,971,1149] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.620,0.361]
select surf_pocket9, protein and id [2926,2930,2934,2933,3607,3219,3228,3229,2925,2938] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.631,0.278]
select surf_pocket10, protein and id [2753,2762,2751,2752,2766,2768,2343,2551,2552,2553,2554] 
set surface_color,  pcol10, surf_pocket10 
   
        
        deselect
        
        orient
        