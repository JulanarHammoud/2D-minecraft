2D-minecraft Game 

01/09-10/09

My partner Julanar and I started learning about Godot. We watched a lot of YouTube videos to understand how to use it. We followed everything in the videos step-by-step to keep it in our minds and not forget it. It took us a lot of hours and days until we got the hang of it.

~20 hours

11/09-20/09

We started developing a Flappy Bird game at the request of Professor Roy to ensure we fully understood Godot. First, we learned to set up the main elements: the player character (the bird), the obstacles (pipes), and the environment (background). We had to figure out how to make the bird jump with a tap, adding a simple gravity effect to bring it down naturally.
Then, we tackled creating the obstacles that move from right to left. We learned how to spawn new pipes at regular intervals, with random gaps to make the game challenging. It took time to understand how to use signals and physics in Godot, but by referencing the videos and experimenting, we finally got it to work. In the end, the game ran smoothly, and it felt great to see everything we learned come together into a playable game.

~20 hours



https://github.com/user-attachments/assets/3b52b247-23a2-4cb9-9e63-53cbe0b615ec



21/09-30/09

We began exploring the concept of creating a Minecraft-like game and researched online through Google and YouTube to see how similar games were implemented in other engines. My partner, Julanar, and I started examining the code provided by Roy, going through it one class at a time to understand each component. We used ChatGPT to help clarify the purpose and function of each class.
After reviewing and understanding each part, we began linking the classes together to see how they interacted. This helped us see how the game mechanics and environment could be built up step-by-step. 

~20 hours 

01/10-10/10 

Our first task was to change the shape of the tiles from squares to rectangles. We needed to adjust this in both the TileMap and TileSet, but we ran into some coding issues because it also required altering the width and height of each tile. Since there were several classes managing different aspects of the tiles, we had to carefully track each one and make the necessary changes.
We learned to modify the tile size properties, which involved understanding how TileMap and TileSet work together in Godot. This took some time, as we needed to test and debug the code to ensure everything aligned correctly. After carefully following each step and making adjustments, we finally got it to look just like it did in the tutorial video.


https://github.com/user-attachments/assets/109dbe73-4fb4-462a-9892-f643d06ec9b7


~15 hours

11/10-17/10

We wanted to change the tiles to this shape, resembling a brick-like pattern with an offset on every other row:
 ![image](https://github.com/user-attachments/assets/ce04aabe-744f-42c0-9b79-cf977e7e63c7)

In attempting this adjustment, we encountered several challenges. First, aligning the tiles in this pattern required modifying the alignment settings in the TileMap, which wasn’t straightforward, as the default grid didn’t support this type of offset easily. Additionally, the collision boundaries became an issue since the new layout didn’t follow a simple grid pattern; we had to carefully update each tile’s collision shape to avoid gaps or overlaps. Adjusting the TileMap properties to support alternating row offsets also presented difficulties, as we needed to ensure each row shifted correctly without disturbing the overall structure. Finally, the rendering sometimes appeared uneven due to the non-standard layout, requiring fine-tuning to keep the tiles visually consistent. After tackling each of these issues, the pattern finally worked as expected, and it was rewarding to see the result align perfectly with our design vision.


https://github.com/user-attachments/assets/c6eac91e-604b-40e0-92ab-81829b4e6f34



~10 hours

18/10-31/10

We decided to change the tile shape to a hexagon, which proved to be quite challenging. Unlike before, where we could edit the existing TileMap, this time we had to create a completely new TileMap specifically designed for hexagons. To achieve this, we needed a custom grid of 256x256 pixels, divided into 16x16 squares, with a hexagon fitting inside each square. Each hexagon needed its vertices to align precisely with the edges of the square.
To create this new TileMap, we had to use a new software program called GIMP. It took us some time to learn how to use it, so we watched tutorials to understand the basics. After a lot of trial and error, we finally managed to design a TileMap that was suitable for hexagons. We then loaded this TileMap into our game and made the necessary adjustments in the code’s scripts. Once everything was in place, it worked smoothly.
Next, we wanted to incorporate all the different tile shapes so that the player could choose which tile shape they preferred before starting the game. We divided the work: I handled the graphics, designing an interface that allowed tile selection, while Julanar  focused on scripting to ensure the tile-switching function worked as intended. This part took additional time due to some errors that came up, which we had to troubleshoot and fix.  However, in the end, everything worked perfectly, and we were able to provide a seamless tile selection option for the player



https://github.com/user-attachments/assets/b67f5f85-f8aa-40a7-8a0c-a21515ca7034



~30 hours


