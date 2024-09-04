
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
        
        load "data/3fcrA.pdb", protein
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
 
        load "data/3fcrA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1240,1241,1242,1254,1255,1262,1354,481,500,482,2314,491,2099,2313,2311,1239,1235,1236,1245,1834,1867,1868,952,955,956,2090,2091,2092,946,2363,2366,2369,2306,2307,2372,957,958,959,963,964,1246,1247,985,2075,2076] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [741,772,776,912,917,920,921,922,935,937,769,798,770,767,771,713,715,705,706,704,733,924,2604,2605,2610,904,1032,2556,2557,2560,2546,2406,2474,2450,2503,2504,2545,2547,2449,2477,2407,1033,2548,2470,2471,2472,2476] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [2990,2856,2826,2823,2843,3477,3002,3355,3357,3472,3496,2878,3474,3495,3497] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [1861,1863,1865,1874,3330,3331,3333,1875,465,3270,1884,3271,3343,3344,493,3288,3299,3305,3272,3274] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [472,473,474,449,535,537,447,3260,366,448,3261,432,3280,365,308,309,310,311,290,292] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [2354,539,540,330,533,326,329,321,507,535,2337,2355,584,2342,2343,2346,2350,2352,2351,320] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        