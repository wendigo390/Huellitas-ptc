﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Huellitas_ptc
{
    public class CarritoProd
    {
        public int ItemId { get; set; }
        public int ProductID { get; set; }
        public int UserId { get; set; }
        public int Quantity { get; set; }
        public double UnitPrice { get; set; }
        public string CartId { get; set; }
    }
}