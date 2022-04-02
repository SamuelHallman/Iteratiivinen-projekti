using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Net;

namespace Testing
{
    class Program
    {
        static void Main(string[] args)
        {
            string koulutus = @".\Koulutus.txt";

            
            if (File.Exists(koulutus))
            {
                string ensimmäinenYritys = File.ReadAllText(koulutus);
                string[] tiedot = ensimmäinenYritys.Split('\n');
                for (int i = 0; i < tiedot.Length - 1; i++)
                {
                    int paikka1 = tiedot[i].IndexOf(";");
                    int paikka2 = tiedot[i].IndexOf(";");
                    Console.WriteLine(paikka2 + " " + paikka1);
                    Console.WriteLine(tiedot[i].Substring(paikka2 + 1, tiedot[i].Length - paikka2 - 1));
                    Console.WriteLine();
                }
                //Console.Write(File.ReadAllText(koulutus));
                Console.ReadLine();
            }


            /*string koulutus = @".\Koulutus.txt";
            if (File.Exists(koulutus))
            {
                string ensimmäinenYritys = File.ReadAllText(koulutus);
                string[] tiedot = ensimmäinenYritys.Split('\n');
                for (int i = 0; i < tiedot.Length - 1; i++)
                {
                    int paikka1 = tiedot[i].IndexOf("name");
                    int paikka2 = tiedot[i].IndexOf("Oy", paikka1 + 1);
                    Console.WriteLine(paikka2 + " " + paikka1);
                    Console.WriteLine(tiedot[i].Substring(paikka2 + 1, tiedot[i].Length - paikka2 - 1));
                    Console.WriteLine();
                }
                //Console.Write(File.ReadAllText(koulutus));
                Console.ReadLine();
            }*/
            /*int i = 0;

            while (i < 10)
            {
                int paikka1 = ensimmäinenYritys.IndexOf("name");
                int paikka2 = ensimmäinenYritys.IndexOf("Oy", paikka1 + 1);
                string yritysNimi = ensimmäinenYritys.Substring(paikka1 + 7, paikka2 - paikka1 - 5);
                Console.WriteLine(yritysNimi);
                i++;
            }


            
            //Console.WriteLine(File.ReadAllText(koulutus));
            Console.ReadLine();*/
        }
    }
}
