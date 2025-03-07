import 'package:cached_network_image/cached_network_image.dart';
import 'image_place_holder.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorPlaceholder;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.placeholder,
    this.errorPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl??'',
      fit: fit ?? BoxFit.cover,
      placeholder: (BuildContext context, _) {
        return placeholder ?? ImagePlaceHolder();
      },
      errorWidget: (context, url, error) {
        return errorPlaceholder ?? const Icon(Icons.broken_image, size: 25, color: Colors.grey);
      },
    );
  }
}
