
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
        
        load "data/1hf3B.pdb", protein
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
 
        load "data/1hf3B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4518,4671,4513,5038,5048,5050,5091,5061,5062,5063,5079,5081,5083,3330,3332,3333,5045,5046,5049,4530,4533,4529,4521,3329,5039,5044,5220,5223,5225,5245,4543,4541,4542,4338,4366,5218,3341,5232,5226,3367,5227,3405,3407,5231,3665,3666,5422,3857,5431,3806,3855,3808,3856,4365,5432,5111,5112,5113,5842,3480,3314,3324,3325,3340,4080,3409,3411,3663,3858,4081,3879,5783,5829,4676,4680,4682,4681,4683,4688,4689,4690,4698,4724,4695,4673,4835,4836,4898,4843,5780,5802,5803,5788] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [5518,5528,5530,5550,4380,5459,5461,5497,5495,5498,5499,4406] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        