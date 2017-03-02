using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SOE.Models;
using System.ServiceModel.Activation;
using We7.Model.Core.Data;
using Thinkment.Data;
using We7.CMS;
using We7.Framework;
using We7.CMS.Common;
using System.Data;

namespace SOE.WcfServices
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class LectureService : ILectureService
    {
        public IList<Lecture> GetAvailableLectures()
        {
            string ModelName = "SOE.Lecture";
            ModelDBHelper helper = ModelDBHelper.Create(ModelName);
            Criteria criteria = CreateCriteria(null, false, false, null);
            List<Order> orders = CreateOrders();
            DataRowCollection items = helper.QueryPagedList(criteria, orders, 0, 10).Rows;
            return ConvertToModel(items);
        }

        protected virtual IList<Lecture> ConvertToModel(DataRowCollection items)
        {
            IList<Lecture> lectures = new List<Lecture>();
            foreach (DataRow data in items)
            {
                Lecture lecture = new Lecture()
                {
                    ID = ConvertToString(data["ID"]),
                    AccountID = ConvertToString(data["AccountID"]),
                    Address = ConvertToString(data["Address"]),
                    Cate = ConvertToString(data["Cate"]),
                    Description = ConvertToString(data["Description"]),
                    DueTime = DateTime.Parse(ConvertToString(data["DueTime"])),
                    Organizer = ConvertToString(data["Organizer"]),
                    OwnerID = ConvertToString(data["OwnerID"]),
                    Speaker = ConvertToString(data["Speaker"]),
                    StartTime = ConvertToString(data["StartTime"]),
                    State = 1,
                    Title = ConvertToString(data["Title"]),
                    Type = ConvertToString(data["Type"])
                };
                lectures.Add(lecture);
            }
            return lectures;
        }

        private string ConvertToString(object obj)
        {
            if (obj == null) return string.Empty;
            else return obj.ToString();
        }

        protected HelperFactory HelperFactory
        {
            get
            {
                return HelperFactory.Instance;
            }
        }

        protected ChannelHelper ChannelHelper
        {
            get
            {
                return HelperFactory.GetHelper<ChannelHelper>();
            }
        }

        protected virtual List<Order> CreateOrders()
        {
            return new List<Order>
            {
                new Order("Updated",OrderMode.Desc),
                new Order("ID",OrderMode.Desc)
            };
        }

        protected virtual Criteria CreateCriteria(string ownerID, bool includeChildren, bool showTop, string tag)
        {
            Criteria criteria = new Criteria();
            if (String.IsNullOrEmpty(ownerID))
            {
                ownerID = "{f5a2e63a-9e54-4008-83d6-ab37c572d225}";
            }
            if (includeChildren)
            {
                Criteria subCriteria = new Criteria();
                subCriteria.Mode = CriteriaMode.Or;
                subCriteria.Add(CriteriaType.Equals, "OwnerID", ownerID);

                List<Channel> channels = ChannelHelper.GetChannels(ownerID);
                if (channels != null && channels.Count > 0)
                {
                    foreach (Channel channel in channels)
                    {
                        criteria.AddOr(CriteriaType.Equals, "OwnerID", channel.ID);
                    }
                }
            }
            else
            {
                criteria.Add(CriteriaType.Equals, "OwnerID", ownerID);
            }
            if (showTop)
            {
                criteria.Add(CriteriaType.Equals, "IsShow", 1);
            }
            if (!String.IsNullOrEmpty(tag))
            {
                criteria.Add(CriteriaType.Like, "Tags", "%" + tag + "%");
            }
            criteria.Add(CriteriaType.Equals, "State", 1);
            criteria.Add(CriteriaType.MoreThan, "DueTime", DateTime.Now);
            return criteria;
        }
    }
}
