
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
        
        load "data/3b6rB.pdb", protein
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
 
        load "data/3b6rB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [5489,5494,5495,4449,4452,5500,5561,5484,5485,5486,5465,4411,5477,4408,4819,5262,5263,4406,4409,4412,5260,5261,5560,5249,5250,3920,3921,5248,4836,4445,4435,4718,4429,4387,4384,4407,4400,5194,5195,3460,5448,5467,5186,5187,3671,3672,5449,4742,4743,4744,4745,4749,4752,4753,4788,4719,3951,3952,3953,3954,5230,3933,3934,3935,3936,5234,5235,5604,5603,3931,3932,5246,5243,5245,5244,4497,4480,4481,4487,3431,3423,3428,3475,3409,4501,4504,5502,5503,4456,4493,4495,4496,3476,3483,3484,3473,3474,3480,3482,3490,5174,3470,3464,4746,4503,3384] 
set surface_color,  pcol1, surf_pocket1 
   
        
        deselect
        
        orient
        