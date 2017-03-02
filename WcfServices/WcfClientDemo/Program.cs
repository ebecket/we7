using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SOE.WcfClientDemo.ServiceReference1;

namespace SOE.WcfClientDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            using(LectureServiceClient client = new LectureServiceClient() ){
                var lectures = client.GetAvailableLectures();
                foreach (var lecture in lectures)
                {
                    Console.WriteLine(lecture.Title);                
                }
                Console.ReadLine();
                client.Close();
            }
            
        }
    }
}
