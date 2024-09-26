using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class Notice
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Photo { get; set; }
        public string PublishTime { get; set; }
        public int FaSongID { get; set; }

        public Notice(int id, string title, string content, string photo, string publishTime, int faSongID)
        {
            Id = id;
            Title = title;
            Content = content;
            Photo = photo;
            PublishTime = publishTime;
            FaSongID = faSongID;
        }

        public Notice()
        {
        }
    }
}
