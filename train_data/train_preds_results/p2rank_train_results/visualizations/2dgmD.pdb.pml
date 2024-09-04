
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
        
        load "data/2dgmD.pdb", protein
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
 
        load "data/2dgmD.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [12991,12999,13000,11793,11797,12977,12750,12761,11293,11311,13043,12092,12094,11799,11803,12093,11804,11784,11787,12990,11805,11789,11790,11295,11301,12091,12499,12090,12470,12747,12751,12767,12485] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.365,0.278,0.702]
select surf_pocket2, protein and id [11763,11764,13282,11755,11756,11757,11758,13150,13286,11588,13277,13279,13281,13271,13272,13273,13274,13276,13189,11509,13263,13266,13267,11596,11566,11594,11595,11567,13188,13190,11753,13125,13123,13208,13146,13148,11746,11749,11754,11739,11483,11510] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.792,0.361,0.902]
select surf_pocket3, protein and id [12816,12818,13435,13471,13472,13475,13432,13468,13469,13478,13479,13434,11638,11661,11664,11632,11657,11658,13439,11663,11656,11633,11634,11635,11636,13433,13436,11630,13501,13503,13437] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.702,0.278,0.533]
select surf_pocket4, protein and id [12505,12131,12132,12506,12508,12507,12509,12510,12244,12245,12246,14070,14071,14076,14077,14080,14081,14064,12268] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.902,0.361,0.361]
select surf_pocket5, protein and id [13828,13833,13834,13832,13901,13903,13904,14108,13860,13921,14127,14125,14126,14124,13919] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.702,0.533,0.278]
select surf_pocket6, protein and id [12282,12285,12288,12289,14118,13826,13697,13698,13699,13851,13852,12307,12306,12308,13716] 
set surface_color,  pcol6, surf_pocket6 
   
        
        deselect
        
        orient
        