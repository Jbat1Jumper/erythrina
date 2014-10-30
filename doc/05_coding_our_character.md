### Erythrina
# Coding our character

Yes, finally, something useful. Maybe, I hope. In the last tutorial, or chapter, or whatever, I actually forgot the ballons and the dialog. It was more of the same, add an animated sprited, add an animator, etc, repeat. But I've placed the dialog like the menu, inside another object actually called "dialogs" because we will make more of these. With this covered let's move to the code itself.

Let's recap we need to do:

- We need our character to move left and right
- We need some controls keys, and also touch the screen so we can port it to mobile later
- We need some falling food, and other things, like chainsaws
- We need to update the score and lives
- We need to die (yes, we all  die)
- We need to get the menu working, and change the game state from menu to playing

Then, when everything on that list is done, we could add other stuff like jumping, items, buffs, etc, etc. But first, and important, we have to finish everything in that list so we can enjoy our little finished game. Actually I'm saying that more to myself, because I'm writing this in some sort of self punishment. Also to take an habit and practice english. IF YU CAN RED THIZ IM DUING FINE. 

So, we need to start. 

## Adding scripts to a node

Godot uses their own script language called GDScript. They have their reasons to use it and they are out of discussion. But the good news are that it's almost like Python. Almost anything in the sintax is borrowed from there, but there were added, or changed, some keywords to accommodate to the engine. The full reference for the language is [here](https://github.com/okamstudio/godot/wiki/gdscript).

Also I will not stop in programming basics. I will try to explain the code, step by step, but only in functionality and relevant api stuff. Any detail about a function can be found in the reference, in the help tab at the right.

For anyone coming from Unity3D, or similar, adding a script is almost the same as adding a behaviour. We can inherit from another script or something but we can't add multiple scripts to a node. Sad but it's fine. If we need to compose an entity from multiple behaviours we can compose it with more nodes. Hell yeah. But not now. If you didn't understand anything of above don't worry. I didn't said nothing, I got distracted. 

Here, we want to add a script to our character so we will head for his node. In Godot there are two ways of adding a script. One is to make a file for the script and add that script to a node, and the other is to save the script inside the same scene. We will stay with the first because it's more manageable for almost anything, but for simple things like a button which requires like two or three lines we can go with the built-in script.

We can open the dialog to create a new script for the node just clicking here.

![](img/5/godot01.png)

Then a dialog like this one will appear.

![](img/5/godot02.png)

Then in this dialog we can select from which class or other script inherits our script and the file name where we want to save it. The base class will be AnimatedSprite for now because our player is an animated sprite.   

Alternatively we can create a .gd text file, which is the format for the Godot script, and then open it from the inspector (properties panel).

After that a dialog would appear our script editor. With the base of our script.

![](img/5/godot03.png)

The ```extends``` line is to specify from what this script inherits, we can change it later.

It shows in a comment how to declare public variables which will be accessible from the inspector and an empty ```_ready()``` method which will be called when the "host" node of the script is instantiated. Everything nice.

## Making him move

Here we need to add our player logic so we can make him moving. For every node, actually for anything which inherits from the Node class, there is a ```_process()``` method. (We can search for it in the help) This function is called every frame when the node has the process enabled. And enabling the process it's simple as call ```set_process(true)``` on our node. Because we need our logic everytime we will add this to the ```_ready()``` function.

![](img/5/godot04.png)

Then, to simply move our character to the right we need to update his position. To add a value, which we will accurately call ```speed```, to it's position. It's too accurate the name speed for the variable, that we will make it a public variable also, using the keyword ```export```.

Many of the variables in the Godot api are accessed by functions. To change the position we need to use the functions ```get_pos()``` and ```set_pos()```. 

The position is represented by a Vector2D class (reference in help). Its components can be accessed intuitively using ```.x``` and ```.y```. We put everything together and then we end up with this.

![](img/5/godot05.png)

We also multiplied the speed by the deltatime. Nothing can assure that each frame lasts for the same time, so a float representing the time passed since last frame is passed as argument to ```_process()```.

Now you can enjoy pressing play and looking at how our character slowly slides to the right.


![](img/5/gif_01.gif)

Maybe he's just stalking that fat guy. Our Little Bald Boy is actually a weird person. 

Now we can adjust the speed directly from the inspector to a value which satisfies us.

. . .

Ok, a tornado has just destroyed the electrical network in my homeworld so it's not easy to be here. Almost everyone is getting insane and all the remaining cyber-tea houses are full. But that's fine, we will survive.

. . .

Now that we know how to move our character to the right we should give him the possibility to also go to the left. But, how will he go to both sides at the same time? And here is where I like to separate the things a little. 

I like to fill the base character with all the logic on how to move, but don't give him the logic of where and when to move. Hmmm, maybe I'm confusing things a little. What I'm trying to tell is that if we put the logic of, for example, detect the keyboard keys, inside our character we will end up with an unmaintainable script.

What I like to do is not complicated and I find it one of the best ways to extend everything later. I just write public functions to, for example, go left, go right, stop, etc. And then make another magic node, opportunely called "controller", with all the input logic in it.

Therefore let's make that functions. Luckily this is already written and the functions are here.


![](img/5/godot06.png)

Now when we call any of that functions, our character will change its movement. We actually can also call these functions from an animation. Which is cool, but our character only slides stoned but doesn't move. What we need to do is to change the animations. We need to access to the animator.

We need to get a reference to another node in the scene. This is something that we will do a lot, because interactions in our game involve interactions between our nodes. In any script which extends a Node, or another subclass, we can use the function ```get_node(path)``` which does what its name tell us what is does. The argument "path" is a string which points to the desired node. It works equal as a system path so we can reference the current node with ".", the parent node with ".." use "/" to reference subnodes, etc. 

All the nodes are referenced by an unique name and there's only one exception for the name "root", using "/root" will reference to the base node of our game. But now we only need to reference the animator which is nested inside the player node. Therefore we just use "./anim" and we're done.

After that we only store the reference and use the ```play(name)``` function each time we need to change the animation. Let's see it all in code. (Note to self, I need to start using code snippets instead of screenshots)


![](img/5/godot07.png)


And this works like a charm. If we want to make bullet proof code we can check if the animation exists using the ```has_animation(name)``` method on the animator.

Here a gif showing how easily the character can be controlled using an animator.

![](img/5/gif_02.gif)

Trust me, I used another animator for this and a Func Call track.

Now we need him to not run backwards. And here the only thing we need to do is to flip the sprite in horizontally.

```python
func go_left():
	set_flip_h(true)
	if anim.has_animation("walk"):
		anim.play("walk")
	heading_direction = -1.0

func go_right():
	set_flip_h(false)
	if anim.has_animation("walk"):
		anim.play("walk")
	heading_direction = 1.0
```

Oh, snippets. No more ugly code screenshots. I only need to get some better code highlighting.

Here we called the ```set_flip_h(bool)``` method to do the work. We actually do not need to set the horizontal flip on the ```stop()``` method because then our character will face to the same side each time he stops.

And here we are. Our Little Bald Boy is happy and jumping in the fields, or park, whatever.

![](img/5/gif_03.gif)


Now let's head to the next topic on our list.

## Adding a controller...

. . .

Tomorrow. Now I only hope that there aren't more tornadoes nearby. They love to stay for a while, go from bar to bar, get drunk and make a mess. I need to buy a gun.

. . .