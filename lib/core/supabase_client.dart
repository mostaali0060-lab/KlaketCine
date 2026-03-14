import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClient {
  static const supabaseUrl = 'vynqmypohcgzqgpnfwhi.supabase.co';
  static const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ5bnFteXBvaGNnenFncG5md2hpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMxODcyNTYsImV4cCI6MjA4ODc2MzI1Nn0.I1WO2FIfOOqA2ne3olhflqq_61pYdC7WGzjvwU9359U';

  static final client = Supabase.instance.client;
}
