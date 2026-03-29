import 'dart:io';

void main() {
  final dir = Directory('d:/opaal/lib');
  if (!dir.existsSync()) return;

  final files = dir.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart'));

  for (final file in files) {
    String content = file.readAsStringSync();
    bool changed = false;

    if (content.contains('.withOpacity(')) {
      content = content.replaceAll('.withOpacity(', '.withValues(alpha: ');
      changed = true;
    }

    if (content.contains('GoogleFonts.serif(')) {
      content = content.replaceAll('GoogleFonts.serif(', 'GoogleFonts.ptSerif(');
      changed = true;
    }

    if (changed) {
      file.writeAsStringSync(content);
      print('Fixed \${file.path}');
    }
  }
}
