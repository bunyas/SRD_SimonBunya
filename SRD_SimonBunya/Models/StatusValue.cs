using System;
using System.Collections.Generic;

namespace SRD_SimonBunya.Models;

public partial class StatusValue
{
    public int Id { get; set; }

    public string StatusValues { get; set; } = null!;

    public virtual ICollection<Form> Forms { get; set; } = new List<Form>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();
}
