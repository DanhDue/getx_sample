// Copyright (c) 2023, one of the D3F outsourcing projects. All rights reserved.

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) operationFor) {
    return operationFor(this);
  }
}
