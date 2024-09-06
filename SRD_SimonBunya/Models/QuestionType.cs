using System;
using System.Collections.Generic;

namespace SRD_SimonBunya.Models;

public partial class QuestionType
{
    public int Id { get; set; }

    public string QuestionTypes { get; set; } = null!;

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();
}
