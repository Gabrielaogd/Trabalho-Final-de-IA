
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
        
        load "data/3kvmA.pdb", protein
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
 
        load "data/3kvmA.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [2483,2513,2487,2489,2490,2492,2495,2500,2512,2491,2493,533,524,199,200,551,919,921,2344,2476,2502,2506,2341,107,2510,2516,2518,2519,2521,138,135,883,885,2499,2501,884,827,829,193,170,192,194,195,198,809,171,2528,2503,2352,2353,872,869,515,519,522,552,224,227,250,251,253,255,256,285,129,128,219,222,223,2548,65,66,304,2557,106,2556,97,98,99,262,636,226,296,898,868,2113,2114,2117,2122,2112,2333,2337,2140,2334,2338,2339,2340,1964,2111,1970,1976,901,1452,899,900,1444,1188,1756,1968,1969,700,938,1418,936,1436,1437,2331,1958] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [947,750,944,923,801,212,200,202,234,528,208,209,211,205,181,562,942,948,559,561,962,961,963,741,544,232,233,574,575,207] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        