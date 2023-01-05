// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/d3f_base_response_json_to_t_generator.dart';

Builder genJsonToThisOne(BuilderOptions options) => SharedPartBuilder(
    [D3FBaseResponseJsonToTGenerator()], 'd3f_base_response_json_to_t_generator');
