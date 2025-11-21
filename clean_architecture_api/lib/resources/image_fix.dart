const String _brokenImageUrl =
    'https://images.unsplash.com/photo-1581091215367-59ab6b90d1e5?auto=format&fit=crop&w=800&q=60';

const String _replacementImageUrl =
    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=800&q=60';

const String _secondBrokenImageUrl =
    'https://images.unsplash.com/photo-1580894732444-8ecded7900f9?auto=format&fit=crop&w=800&q=60';

const String _secondReplacementImageUrl =
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=60';

const String _thirdBrokenImageUrl =
    'https://images.unsplash.com/photo-1590608897129-79da98d159e9?auto=format&fit=crop&w=800&q=60';

const String _thirdReplacementImageUrl =
    'https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?auto=format&fit=crop&w=800&q=60';

String fixImageUrl(String url) {
  if (url.contains('photo-1581091215367-59ab6b90d1e5')) {
    return _replacementImageUrl;
  }
  if (url.contains('photo-1580894732444-8ecded7900f9')) {
    return _secondReplacementImageUrl;
  }
  if (url.contains('photo-1590608897129-79da98d159e9')) {
    return _thirdReplacementImageUrl;
  }
  return url;
}
