method FindMax(a:array<int>) returns (maxIndex:nat)
    requires a.Length > 0
    ensures maxIndex<a.Length
    ensures forall j:nat | j<a.Length :: a[j] <= a[maxIndex]
{
    var j:nat := 0;
    maxIndex := 0;
    while(j < a.Length) 
        invariant j <= a.Length
        invariant maxIndex < a.Length
        invariant forall k:nat | k<j :: a[maxIndex] >= a[k]
    {
        if(a[j] > a[maxIndex]) {
            maxIndex := j;
        }
        j := j+1;
    }
    assert j >= a.Length;   
    assert forall j:nat | j<a.Length :: a[j] <= a[maxIndex];
}
