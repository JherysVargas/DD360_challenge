import 'package:cached_network_image/cached_network_image.dart';
import 'package:dd360_challenge/ui/widgets/error_image_widget.dart';
import 'package:dd360_challenge/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class RenderListData extends StatelessWidget {
  const RenderListData({
    super.key,
    required this.data,
    required this.loading,
    required this.sectionName,
  });

  final List data;
  final bool loading;
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionName(),
          const SizedBox(height: 12),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildSectionName() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        sectionName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _buildList() {
    return Flexible(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: loading ? 10 : data.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, index) {
          final item = loading ? null : data[index];
          return SizedBox(
            width: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(item?.thumbnail),
                const SizedBox(height: 10),
                _buildName(item?.title),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingImage() => const LoadingWidget(height: 150);

  Widget _buildImage(thumbnail) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.hardEdge,
        child: AnimatedSwitcher(
          duration: kThemeAnimationDuration,
          child: loading
              ? _buildLoadingImage()
              : CachedNetworkImage(
                  imageUrl: "${thumbnail!.path}.${thumbnail!.extension}",
                  fit: BoxFit.fitWidth,
                  width: 120,
                  alignment: Alignment.center,
                  progressIndicatorBuilder: (_, __, ___) =>
                      _buildLoadingImage(),
                  errorWidget: (_, __, ___) => const ErroImage(),
                ),
        ),
      ),
    );
  }

  Widget _buildName(name) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: loading
          ? const LoadingWidget(height: 10)
          : Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
