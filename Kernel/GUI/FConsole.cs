﻿using Kernel.Driver;
using Kernel.FS;
using Kernel.Misc;
using System.Drawing;

namespace Kernel.GUI
{
    internal class FConsole : Form
    {
        string Data;
        public Image ScreenBuf;
        string Cmd;

        public FConsole(int X, int Y) : base(X, Y, 640, 320)
        {
            Title = "Console";
            Cmd = string.Empty;
            Data = string.Empty;
            BackgroundColor = 0x0;
            ScreenBuf = new Image(640, 320);

            Console.OnWrite += Console_OnWrite;
            PS2Keyboard.OnKeyChanged += PS2Keyboard_OnKeyChanged;
            Console.WriteLine("Type help to get information!");
        }

        private void PS2Keyboard_OnKeyChanged(System.ConsoleKeyInfo key)
        {
            if(key.KeyState == System.ConsoleKeyState.Pressed)
            {
                if (key.Key == System.ConsoleKey.Backspace)
                {
                    if (Data.Length != 0)
                        Data.Length -= 1;
                }
                else if (key.KeyChar != '\0')
                {
                    Console_OnWrite(key.KeyChar);

                    string cs = key.KeyChar.ToString();
                    string cache1 = Cmd;
                    Cmd = cache1 + cs;
                    cache1.Dispose();
                }

                if (key.Key == System.ConsoleKey.Enter)
                {
                    if(Cmd.Length!=0) Cmd.Length -= 1;
                    switch (Cmd)
                    {
                        case "hello":
                            Panic.Error(": )");
                            break;

                        case "help":
                            Console.WriteLine("nes: exec built-in nes emulator");
                            break;

                        case "nes":
                            Console.WriteLine("Emulator Keymap:");
                            Console.WriteLine("A = Q");
                            Console.WriteLine("B = E");
                            Console.WriteLine("Z = Select");
                            Console.WriteLine("C = Start");
                            Console.WriteLine("W = Up");
                            Console.WriteLine("A = Left");
                            Console.WriteLine("S = Down");
                            Console.WriteLine("D = Right");
                            Console.WriteLine("Game Will Start After 2 Seconds");
                            Console.OnWrite -= Console_OnWrite;
                            PS2Keyboard.OnKeyChanged -= PS2Keyboard_OnKeyChanged;
                            Program.DoGUI();
                            HPET.Wait(2000);
                            NES.NES nes = new NES.NES();
                            nes.openROM(File.Instance.ReadAllBytes("/MARIO.NES"));
                            Console.WriteLine("Nintendo Family Computer Emulator Initialized");
                            Framebuffer.TripleBuffered = true;
                            for (; ; )
                            {
                                nes.runGame();
                                for (int i = 0; i < 128; i++) Native.Nop();
                            }
                            break;

                        default:
                            Console.Write("No such command: \"");
                            Console.Write(Cmd);
                            Console.WriteLine("\"");
                            break;
                    }
                    Cmd.Dispose();
                    Cmd = string.Empty;
                }
                else if (key.Key == System.ConsoleKey.Backspace) if (Cmd.Length != 0) Cmd.Length -= 1;
            }
        }

        public override void Update()
        {
            base.Update();
            int w = 0, h = 0;
            for(int i = 0; i < Data.Length; i++) 
            {

                if ((w + font.Width*2.5f) >= Width ||i %Width == 0 || Data[i]=='\n') { w = 0; h += (int)(font.Height); }
                if (Data[i] != '\n')
                {
                    w += font.Width;
                    font.DrawChar(X + w, Y + h, Data[i]);
                }
                if (h + (font.Height * 2.5f) > Height) 
                {
                    Data.Dispose();
                    Data = string.Empty;
                    break;
                }
            }
            
            if(w == Width) { w = 0;h += (int)(font.Height); } else { w += font.Width; }
            font.DrawChar(X + w, Y + h, '_');
        }

        private void Console_OnWrite(char chr)
        {
            string cs = chr.ToString();
            string cache = Data;
            Data = cache + cs;
            cs.Dispose();
            cache.Dispose();
        }
    }
}
