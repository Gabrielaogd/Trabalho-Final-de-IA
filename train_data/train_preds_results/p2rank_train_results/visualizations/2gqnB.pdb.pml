
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
        
        load "data/2gqnB.pdb", protein
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
 
        load "data/2gqnB.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [4386,4400,4401,4402,4548,4552,3823,3824,3825,5610,4572,4573,5608,3639,3641,3642,3643,3644,3648,4641,5613,4403,4407,4409,4211,5359,4563,5590,5857,5596,4194,5855,5856,5592,5673,5687,3822,3819,3820,3821,3827,3840,4188,4196,4187,4182,5686,4387,4165,4175,4383,3665] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.702,0.278,0.533]
select surf_pocket2, protein and id [3611,3602,3606,3608,3607,3521,3522,3612,3613,3373,3374,4755,3377,3378,3379,3383,3384,3372,3449,3451,3363,4788,3435,3444,3445,3446,4817,4824,3595,3551,3589,3592,3550,4720,4721,3598,3519,3523,3524,3528,3491,3493,3494,3141,3525,3496,3385,3387,4754,4781,4752,4782,4786,4779] 
set surface_color,  pcol2, surf_pocket2 
   
        
        deselect
        
        orient
        