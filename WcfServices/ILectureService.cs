using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SOE.Models;

namespace SOE.WcfServices
{
    [ServiceContract]
    public interface ILectureService
    {
        [OperationContract]
        IList<Lecture> GetAvailableLectures();
    }
}
