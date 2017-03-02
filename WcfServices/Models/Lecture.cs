using System;
using System.Runtime.Serialization;
namespace SOE.Models
{
    [DataContract]
    public class Lecture
    {
        [DataMember]
        public string ID { get; set; }
        [DataMember]
        public string OwnerID { get; set; }
        [DataMember]
        public string Title { get; set; }
        [DataMember]
        public string Speaker { get; set; }
        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public string Address { get; set; }
        [DataMember]
        public string Organizer { get; set; }
        [DataMember]
        public string Type { get; set; }
        [DataMember]
        public string Cate { get; set; }
        [DataMember]
        public string StartTime { get; set; }
        [DataMember]
        public DateTime DueTime { get; set; }
        [DataMember]
        public int State { get; set; }
        [DataMember]
        public string AccountID { get; set; }
    }
}